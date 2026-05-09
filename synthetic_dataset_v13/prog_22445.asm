; DESCRIPTION: Creates a red circular shape at (173, 129) with radius 12.
; PLAN: r0=173(x), r1=129(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 129
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
