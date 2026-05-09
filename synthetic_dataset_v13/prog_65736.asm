; DESCRIPTION: Places a purple 16x61 rectangle at position (242, 48).
; PLAN: r0=242(x), r1=48(y), r2=16(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 48
LDI r2, 16
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
