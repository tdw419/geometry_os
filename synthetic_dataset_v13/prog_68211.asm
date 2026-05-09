; DESCRIPTION: Renders a cyan line between points (16, 153) and (284, 201).
; PLAN: r0=16(x1), r1=153(y1), r2=284(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 153
LDI r2, 284
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
