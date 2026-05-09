; DESCRIPTION: Places a white 69x110 rectangle at position (294, 46).
; PLAN: r0=294(x), r1=46(y), r2=69(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 46
LDI r2, 69
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
