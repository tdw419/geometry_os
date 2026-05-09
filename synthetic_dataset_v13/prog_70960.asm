; DESCRIPTION: Places a white 54x40 rectangle at position (100, 174).
; PLAN: r0=100(x), r1=174(y), r2=54(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 174
LDI r2, 54
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
