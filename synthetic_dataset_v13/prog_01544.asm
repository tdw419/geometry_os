; DESCRIPTION: Renders a white box of size 50x28 starting at (284, 188).
; PLAN: r0=284(x), r1=188(y), r2=50(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 188
LDI r2, 50
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
