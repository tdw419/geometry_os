; DESCRIPTION: Places a cyan line segment connecting (352, 183) to (197, 210).
; PLAN: r0=352(x1), r1=183(y1), r2=197(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 183
LDI r2, 197
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
