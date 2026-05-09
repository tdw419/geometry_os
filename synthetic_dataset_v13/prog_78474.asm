; DESCRIPTION: Places a cyan line segment connecting (317, 209) to (509, 88).
; PLAN: r0=317(x1), r1=209(y1), r2=509(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 209
LDI r2, 509
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
