; DESCRIPTION: Draws a cyan line from (509, 53) to (28, 197).
; PLAN: r0=509(x1), r1=53(y1), r2=28(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 53
LDI r2, 28
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
