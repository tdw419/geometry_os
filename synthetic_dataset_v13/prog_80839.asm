; DESCRIPTION: Places a yellow 111x66 rectangle at position (328, 112).
; PLAN: r0=328(x), r1=112(y), r2=111(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 112
LDI r2, 111
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
