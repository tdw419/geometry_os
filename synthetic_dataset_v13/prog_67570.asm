; DESCRIPTION: Places a yellow 98x61 rectangle at position (289, 182).
; PLAN: r0=289(x), r1=182(y), r2=98(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 182
LDI r2, 98
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
