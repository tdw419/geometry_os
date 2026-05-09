; DESCRIPTION: Composite: Places a cyan 72x30 rectangle at position (167, 31) then Renders a green line between points (108, 226) and (57, 95).
; PLAN: r0=167(x), r1=31(y), r2=72(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x1), r6=226(y1), r7=57(x2), r8=95(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 31
LDI r2, 72
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 226
LDI r7, 57
LDI r8, 95
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
