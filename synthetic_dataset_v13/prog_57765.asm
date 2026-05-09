; DESCRIPTION: Draws a cyan line from (412, 44) to (39, 215).
; PLAN: r0=412(x1), r1=44(y1), r2=39(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 44
LDI r2, 39
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
