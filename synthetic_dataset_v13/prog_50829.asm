; DESCRIPTION: Places a red 49x42 rectangle at position (240, 204).
; PLAN: r0=240(x), r1=204(y), r2=49(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 204
LDI r2, 49
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
