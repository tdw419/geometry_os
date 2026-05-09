; DESCRIPTION: Renders a red box of size 97x45 starting at (284, 195).
; PLAN: r0=284(x), r1=195(y), r2=97(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 195
LDI r2, 97
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
