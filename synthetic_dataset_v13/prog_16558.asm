; DESCRIPTION: Places a cyan 114x55 rectangle at position (46, 113).
; PLAN: r0=46(x), r1=113(y), r2=114(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 113
LDI r2, 114
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
