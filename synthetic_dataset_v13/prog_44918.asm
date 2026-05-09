; DESCRIPTION: Draws a cyan line from (242, 100) to (50, 231).
; PLAN: r0=242(x1), r1=100(y1), r2=50(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 100
LDI r2, 50
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
