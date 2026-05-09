; DESCRIPTION: Places a yellow 92x34 rectangle at position (195, 204).
; PLAN: r0=195(x), r1=204(y), r2=92(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 204
LDI r2, 92
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
