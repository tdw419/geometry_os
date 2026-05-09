; DESCRIPTION: Places a cyan line segment connecting (135, 131) to (392, 236).
; PLAN: r0=135(x1), r1=131(y1), r2=392(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 131
LDI r2, 392
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
