; DESCRIPTION: Renders a red box of size 111x116 starting at (284, 108).
; PLAN: r0=284(x), r1=108(y), r2=111(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 108
LDI r2, 111
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
