; DESCRIPTION: Composite: Places a red 102x102 rectangle at position (184, 85) then Renders a magenta line between points (150, 164) and (479, 255).
; PLAN: r0=184(x), r1=85(y), r2=102(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=150(x1), r6=164(y1), r7=479(x2), r8=255(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 184
LDI r1, 85
LDI r2, 102
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 164
LDI r7, 479
LDI r8, 255
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
