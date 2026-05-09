; DESCRIPTION: Places a white 37x38 rectangle at position (242, 90).
; PLAN: r0=242(x), r1=90(y), r2=37(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 90
LDI r2, 37
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
