; DESCRIPTION: Places a cyan line segment connecting (392, 135) to (168, 87).
; PLAN: r0=392(x1), r1=135(y1), r2=168(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 135
LDI r2, 168
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
