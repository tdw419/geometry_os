; DESCRIPTION: Places a cyan line segment connecting (338, 215) to (488, 176).
; PLAN: r0=338(x1), r1=215(y1), r2=488(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 215
LDI r2, 488
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
