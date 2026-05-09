; DESCRIPTION: Places a yellow 46x82 rectangle at position (412, 162).
; PLAN: r0=412(x), r1=162(y), r2=46(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 162
LDI r2, 46
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
