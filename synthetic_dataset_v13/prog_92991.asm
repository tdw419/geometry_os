; DESCRIPTION: Draws a cyan line from (445, 59) to (433, 101).
; PLAN: r0=445(x1), r1=59(y1), r2=433(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 59
LDI r2, 433
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
