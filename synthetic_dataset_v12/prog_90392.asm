; DESCRIPTION: Draws a cyan line from (456, 245) to (284, 192).
; PLAN: r0=456(x1), r1=245(y1), r2=284(x2), r3=192(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 245
LDI r2, 284
LDI r3, 192
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
