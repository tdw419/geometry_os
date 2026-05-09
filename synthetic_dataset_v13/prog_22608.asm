; DESCRIPTION: Places a blue 46x32 rectangle at position (154, 39).
; PLAN: r0=154(x), r1=39(y), r2=46(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 39
LDI r2, 46
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
