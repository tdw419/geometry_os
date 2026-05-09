; DESCRIPTION: Draws a cyan line from (144, 0) to (284, 103).
; PLAN: r0=144(x1), r1=0(y1), r2=284(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 0
LDI r2, 284
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
