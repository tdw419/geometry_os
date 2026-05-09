; DESCRIPTION: Draws a white line from (178, 213) to (354, 33).
; PLAN: r0=178(x1), r1=213(y1), r2=354(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 213
LDI r2, 354
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
