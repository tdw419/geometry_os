; DESCRIPTION: Places a cyan line segment connecting (442, 194) to (295, 152).
; PLAN: r0=442(x1), r1=194(y1), r2=295(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 194
LDI r2, 295
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
