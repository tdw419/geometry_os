; DESCRIPTION: Composite: Renders a cyan box of size 72x20 starting at (113, 86) then Places a cyan line segment connecting (340, 154) to (479, 184).
; PLAN: r0=113(x), r1=86(y), r2=72(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=340(x1), r6=154(y1), r7=479(x2), r8=184(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 86
LDI r2, 72
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 154
LDI r7, 479
LDI r8, 184
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
