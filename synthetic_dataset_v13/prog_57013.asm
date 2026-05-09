; DESCRIPTION: Places a orange 46x28 rectangle at position (27, 182).
; PLAN: r0=27(x), r1=182(y), r2=46(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 182
LDI r2, 46
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
