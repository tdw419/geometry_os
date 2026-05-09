; DESCRIPTION: Places a cyan line segment connecting (504, 166) to (230, 93).
; PLAN: r0=504(x1), r1=166(y1), r2=230(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 166
LDI r2, 230
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
