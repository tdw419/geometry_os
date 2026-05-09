; DESCRIPTION: Places a red 67x95 rectangle at position (242, 56).
; PLAN: r0=242(x), r1=56(y), r2=67(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 56
LDI r2, 67
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
