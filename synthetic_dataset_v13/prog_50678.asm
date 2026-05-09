; DESCRIPTION: Draws a cyan line from (113, 44) to (72, 16).
; PLAN: r0=113(x1), r1=44(y1), r2=72(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 44
LDI r2, 72
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
