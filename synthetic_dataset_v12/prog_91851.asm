; DESCRIPTION: Draws a cyan line from (284, 65) to (15, 164).
; PLAN: r0=284(x1), r1=65(y1), r2=15(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 65
LDI r2, 15
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
