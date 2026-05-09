; DESCRIPTION: Draws a cyan line from (445, 69) to (210, 197).
; PLAN: r0=445(x1), r1=69(y1), r2=210(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 69
LDI r2, 210
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
