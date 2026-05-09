; DESCRIPTION: Draws a cyan line from (397, 152) to (463, 204).
; PLAN: r0=397(x1), r1=152(y1), r2=463(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 152
LDI r2, 463
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
