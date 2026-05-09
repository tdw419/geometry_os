; DESCRIPTION: Places a green 46x98 rectangle at position (420, 153).
; PLAN: r0=420(x), r1=153(y), r2=46(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 153
LDI r2, 46
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
