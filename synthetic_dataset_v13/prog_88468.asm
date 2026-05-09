; DESCRIPTION: Places a cyan line segment connecting (41, 249) to (284, 212).
; PLAN: r0=41(x1), r1=249(y1), r2=284(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 249
LDI r2, 284
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
