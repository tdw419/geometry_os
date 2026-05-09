; DESCRIPTION: Places a yellow 61x24 rectangle at position (405, 36).
; PLAN: r0=405(x), r1=36(y), r2=61(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 36
LDI r2, 61
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
