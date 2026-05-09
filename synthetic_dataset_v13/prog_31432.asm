; DESCRIPTION: Draws a cyan line from (171, 126) to (69, 175).
; PLAN: r0=171(x1), r1=126(y1), r2=69(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 126
LDI r2, 69
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
