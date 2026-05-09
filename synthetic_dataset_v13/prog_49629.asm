; DESCRIPTION: Places a white 32x61 rectangle at position (405, 46).
; PLAN: r0=405(x), r1=46(y), r2=32(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 46
LDI r2, 32
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
