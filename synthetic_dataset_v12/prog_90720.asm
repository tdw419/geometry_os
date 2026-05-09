; DESCRIPTION: Places a cyan line segment connecting (280, 152) to (492, 43).
; PLAN: r0=280(x1), r1=152(y1), r2=492(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 152
LDI r2, 492
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
