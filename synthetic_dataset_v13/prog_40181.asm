; DESCRIPTION: Places a white 46x29 rectangle at position (146, 72).
; PLAN: r0=146(x), r1=72(y), r2=46(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 72
LDI r2, 46
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
