; DESCRIPTION: Renders a white box of size 72x28 starting at (295, 55).
; PLAN: r0=295(x), r1=55(y), r2=72(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 55
LDI r2, 72
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
