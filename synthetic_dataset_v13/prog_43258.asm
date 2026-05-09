; DESCRIPTION: Draws a white line from (354, 213) to (306, 117).
; PLAN: r0=354(x1), r1=213(y1), r2=306(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 213
LDI r2, 306
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
