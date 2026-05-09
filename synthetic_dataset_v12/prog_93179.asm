; DESCRIPTION: Places a cyan line segment connecting (195, 116) to (346, 208).
; PLAN: r0=195(x1), r1=116(y1), r2=346(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 116
LDI r2, 346
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
