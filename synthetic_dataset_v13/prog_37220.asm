; DESCRIPTION: Draws a black line from (410, 173) to (313, 231).
; PLAN: r0=410(x1), r1=173(y1), r2=313(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 173
LDI r2, 313
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
