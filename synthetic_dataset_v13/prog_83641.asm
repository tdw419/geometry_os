; DESCRIPTION: Renders a white box of size 90x113 starting at (243, 133).
; PLAN: r0=243(x), r1=133(y), r2=90(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 133
LDI r2, 90
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
