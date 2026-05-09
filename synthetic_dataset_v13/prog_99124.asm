; DESCRIPTION: Renders a cyan line between points (178, 157) and (392, 6).
; PLAN: r0=178(x1), r1=157(y1), r2=392(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 157
LDI r2, 392
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
