; DESCRIPTION: Places a cyan line segment connecting (261, 15) to (215, 42).
; PLAN: r0=261(x1), r1=15(y1), r2=215(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 15
LDI r2, 215
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
