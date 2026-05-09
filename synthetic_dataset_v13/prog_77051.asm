; DESCRIPTION: Places a cyan line segment connecting (411, 215) to (282, 55).
; PLAN: r0=411(x1), r1=215(y1), r2=282(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 215
LDI r2, 282
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
