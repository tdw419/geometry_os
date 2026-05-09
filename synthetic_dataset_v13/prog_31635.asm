; DESCRIPTION: Places a white 72x99 rectangle at position (279, 64).
; PLAN: r0=279(x), r1=64(y), r2=72(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 64
LDI r2, 72
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
