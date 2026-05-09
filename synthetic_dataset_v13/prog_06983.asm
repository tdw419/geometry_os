; DESCRIPTION: Places a cyan line segment connecting (436, 127) to (295, 32).
; PLAN: r0=436(x1), r1=127(y1), r2=295(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 127
LDI r2, 295
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
