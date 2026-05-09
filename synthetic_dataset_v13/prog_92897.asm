; DESCRIPTION: Composite: Renders a white line between points (398, 111) and (258, 85) then Renders a green box of size 79x61 starting at (383, 87).
; PLAN: r0=398(x1), r1=111(y1), r2=258(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=87(y), r7=79(width), r8=61(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 111
LDI r2, 258
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 87
LDI r7, 79
LDI r8, 61
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
